<template>
    <div>
        <h2>New Task</h2>
        <div>
            <Button label="New Task" icon="pi pi-plus" @click="visible = true" />
        </div>
        <Dialog v-model="visible" header="New Task" :visible="visible" @update:visible="visible = $event">
            <form class="space-y-4" @submit.prevent="saveTask">
                <h4>Task Details</h4>
                <div>
                    <FloatLabel>
                        <label for="title">Title</label>
                        <InputText id="title" v-model="form.title" />
                        <Message v-if="form.errors.title" severity="error" size="small" variant="simple">{{
                            form.errors.title }}</Message>
                    </FloatLabel>
                </div>
                <div>
                    <FloatLabel>
                        <DatePicker v-model="form.due_on" inputId="due_on" showIcon iconDisplay="input"
                            variant="filled" />
                        <label for="due_on">Due On</label>
                    </FloatLabel>
                </div>
                <div>
                    <FloatLabel>
                        <label for="notes">Notes</label>
                        <Textarea id="notes" v-model="form.notes" rows="5" cols="30" />
                    </FloatLabel>
                </div>

                <div>

                    <Select id="assignee" v-model="form.assignee" :options="employees" optionLabel="name" filter
                        placeholder="Assign To" class="w-full md:w-56" />
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
import DatePicker from 'primevue/datepicker'
import FloatLabel from 'primevue/floatlabel'
import Textarea from 'primevue/textarea'
import InputText from 'primevue/inputtext';
import Select from 'primevue/select';
import Message from 'primevue/message';

defineProps({
    employees: Array
})

import { reactive, ref } from 'vue'
import { useForm } from '@inertiajs/vue3'

const assignedTo = reactive({ id: null, full_name: "" })

const form = useForm({
    title: '',
    notes: '',
    due_on: '',
    assignee: '',
    assigned_by: ''
})

function saveTask() {
    form.post('/tasks')
    visible.value = false
    form.reset()
}

const visible = ref(false)

</script>