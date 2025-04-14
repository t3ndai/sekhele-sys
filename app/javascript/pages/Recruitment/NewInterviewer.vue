<template>
    <div>
        <div>
            <Button
                label="Assign Interviewer"
                @click="visible = true"
                class="action-btn"
            />
        </div>
        <div>
            <Dialog
                v-model:visible="visible"
                header="Assign Interviewer"
                @update:visible="visible = $event"
            >
                <form @submit.prevent="submit">
                    <div>
                        <Select
                            id="interviewer"
                            optionLabel="name"
                            optionValue="id"
                            v-model="form.interviewer_id"
                            :options="employees"
                            filter
                            placeholder="Select Interviewer"
                        />
                    </div>
                    <div class="mt-2">
                        <Button
                            label="Save"
                            class="action-btn"
                            icon="pi pi-save"
                            type="submit"
                            :disabled="form.processing"
                        />
                    </div>
                </form>
            </Dialog>
        </div>
    </div>
</template>

<script setup>
import { Dialog, Button, Select } from "primevue";
import { useForm, usePage } from "@inertiajs/vue3";
import { ref, computed } from "vue";

const visible = ref(false);

const form = useForm({
    interviewer_id: "",
});

function submit() {
    form.post(`/interviews/${interview_id}/interviewers`);
    visible.value = false;
    form.reset();
}

const { interview_id } = defineProps({
    employees: Array,
    interview_id: Number,
});
</script>

<style scoped>
.action-btn {
    background-color: orangered;
    border: none;
}
</style>
