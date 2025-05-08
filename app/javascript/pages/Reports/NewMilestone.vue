<template>
    <div>
        <div>
            <Button
                label="New Milestone"
                icon="pi pi-plus"
                @click="visible = true"
                class="task-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Milestone"
            :visible="visible"
            @update:visible="visible = $event"
            :style="{ width: '50vw' }"
        >
            <form
                class="flex flex-col space-y-4"
                @submit.prevent="saveMilestone"
            >
                <div class="flex flex-col gap-y-0.5 mb-2">
                    <label for="title">Name</label>
                    <InputText id="title" v-model="form.name" />
                    <Message
                        v-if="form.errors.name"
                        severity="error"
                        size="small"
                        variant="simple"
                        >{{ form.errors.name }}</Message
                    >
                </div>
                <div class="flex flex-col gap-y-0.5 mb-2">
                    <label for="due_on">Started On</label>
                    <input
                        type="date"
                        class="form-control"
                        v-model="form.started_on"
                        inputId="due_on"
                        showIcon
                        iconDisplay="input"
                        variant="filled"
                    />
                </div>
                <div class="flex flex-col gap-y-0.5 mb-2">
                    <label for="due_on">Completed On</label>
                    <input
                        type="date"
                        class="form-control"
                        v-model="form.completed_on"
                        inputId="due_on"
                        showIcon
                        iconDisplay="input"
                        variant="filled"
                    />
                </div>
                <div class="flex flex-col gap-y-0.5 mb-2">
                    <label for="description">Description</label>
                    <Editor
                        id="description"
                        v-model="form.description"
                        editorStyle="height: 320px"
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
import InputText from "primevue/inputtext";
import Message from "primevue/message";
import Editor from "primevue/editor";

const { goal } = defineProps({
    goal: Object,
});

import { ref } from "vue";
import { useForm } from "@inertiajs/vue3";

const form = useForm({
    name: "",
    started_on: "",
    completed_on: "",
    description: "",
});

function saveMilestone() {
    form.transform((data) => ({ milestone: data }));
    form.post(`/goals/${goal.id}/milestones`, {
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
