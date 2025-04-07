<template>
    <div>
        <Button label="New Motivation" icon="pi pi-plus" @click="visible = true" />
    </div>

    <div>
        <Dialog v-model="visible" :visible="visible" header="New Motivation" @update:visible="visible = $event">
            <form class="space-y-4" @submit.prevent="saveMotivation">
                <h4>Motivation Details</h4>
                <div>
                    <FloatLabel>
                        <label for="title">Title</label>
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
    description: ''
})

function toggleDialog() {
    console.log('clicked')
    visible.value = !visible.value
}

function saveMotivation() {
    // /employees/:employee_id/motivations
    form.post(`/employees/${employee.value.id}/motivations`)
    visible.value = false
    form.reset()
}


</script>