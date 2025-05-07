<template>
    <div>
        <div>
            <Button
                label="New Task"
                icon="pi pi-plus"
                @click="visible = true"
                class="task-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Task"
            :visible="visible"
            @update:visible="visible = $event"
            :style="{ width: '25vw' }"
        >
            <form class="flex flex-col space-y-4" @submit.prevent="saveTask">
                <div class="flex flex-col gap-y-0.5 mb-2">
                    <label for="title">Title</label>
                    <InputText id="title" v-model="form.title" />
                    <Message
                        v-if="form.errors.title"
                        severity="error"
                        size="small"
                        variant="simple"
                        >{{ form.errors.title }}</Message
                    >
                </div>
                <div class="flex flex-col gap-y-0.5 mb-2">
                    <label for="due_on">Due On</label>
                    <input
                        type="date"
                        class="form-control"
                        v-model="form.due_on"
                        inputId="due_on"
                        showIcon
                        iconDisplay="input"
                        variant="filled"
                    />
                </div>
                <div>
                    <label for="notes">Notes</label>
                    <Textarea
                        id="notes"
                        v-model="form.notes"
                        rows="5"
                        cols="30"
                    />
                </div>

                <div>
                    <Select
                        id="assignee"
                        v-model="form.assignee"
                        :options="employees"
                        optionLabel="name"
                        filter
                        placeholder="Assign To"
                        class="w-full md:w-56"
                    />
                </div>

                <Button
                    label="Save"
                    icon="pi pi-save"
                    type="submit"
                    class="task-btn"
                    :disabled="form.processing"
                />
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import Button from "primevue/button";
import Dialog from "primevue/dialog";
import Textarea from "primevue/textarea";
import InputText from "primevue/inputtext";
import Select from "primevue/select";
import Message from "primevue/message";

defineProps({
    employees: Array,
});

import { reactive, ref } from "vue";
import { useForm } from "@inertiajs/vue3";

const assignedTo = reactive({ id: null, full_name: "" });

const form = useForm({
    title: "",
    notes: "",
    due_on: "",
    assignee: "",
    assigned_by: "",
});

function saveTask() {
    form.post("/tasks", {
        onSuccess: () => {
            visible.value = false;
            form.reset();
        },
    });
}

const visible = ref(false);
</script>

<style scoped>
.task-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
