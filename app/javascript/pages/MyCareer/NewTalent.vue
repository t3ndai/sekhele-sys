<template>
    <div>
        <Button label="New Talent" icon="pi pi-plus" @click="visible = true" />
    </div>

    <div>
        <Dialog v-model="visible" :visible="visible" header="New Talent" @update:visible="visible = $event">
            <form class="space-y-4" @submit.prevent="saveTalent">
                <div>
                    <FloatLabel>
                        <label for="title">Name</label>
                        <InputText id="title" v-model="form.name" />
                    </FloatLabel>
                </div>
                <div>
                    <FloatLabel>
                        <label for="notes">Description</label>
                        <Textarea id="notes" v-model="form.description" rows="5" cols="30" />
                    </FloatLabel>
                </div>
                <div>
                    <Button label="Save" icon="pi pi-save" type="submit" :disabled="form.processing" />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>

import Button from 'primevue/button'
import Dialog from 'primevue/dialog'
import Textarea from 'primevue/textarea'
import FloatLabel from 'primevue/floatlabel'
import InputText from 'primevue/inputtext';
import { useForm, usePage } from '@inertiajs/vue3'
import { ref, computed } from 'vue'

const page = usePage()
const employee = computed(() => page.props.employee)

const visible = ref(false)

const form = useForm({
    name: '',
    description: '',
})

function saveTalent() {
    //employees/:employee_id/talents
    form.post(`/employees/${employee.value.id}/talents`)
    visible.value = false
    form.reset()
}

</script>