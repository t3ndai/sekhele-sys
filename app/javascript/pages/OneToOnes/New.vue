<template>
    <div>
        <div>
            <h2 class="heading belgrano-regular">New 1-1 as of {{ date }}</h2>
            <div>
                <Link :href="`/employees/${employee.id}/one_to_ones`" as="button">
                Back to 1-1s
                </Link>
            </div>
        </div>

        <div>
            <form @submit.prevent="save">
                <Editor v-model="form.one_to_one.note" placeholder="write your 1-1 notes here"
                    editorStyle="height: 320px" />
                <div>
                    <Button label="Save" icon="pi pi-save" type="submit" :disabled="form.processing" />
                </div>
            </form>
        </div>
    </div>
</template>

<script setup>
import { Link } from '@inertiajs/vue3'
import { computed } from 'vue'
import { usePage, useForm } from '@inertiajs/vue3'
import Editor from 'primevue/editor'
import Button from 'primevue/button'


const page = usePage()
const employee = computed(() => page.props.employee)

const props = defineProps({
    date: String,
    report_id: String,
})

const form = useForm({
    one_to_one: {
        note: '',
    }
})

function save() {
    const { report_id } = props
    form.post(`/employees/${report_id}/one_to_ones/`)
}


</script>

<style scoped></style>