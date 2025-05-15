<template>
    <div>
        <div>
            <Button
                label="New Interview Feedback"
                icon="pi pi-plus"
                class="action-btn"
                @click="visible = true"
            />
        </div>

        <div>
            <Dialog
                v-model:visible="visible"
                header="Interview Feedback"
                @update:visible="visible = $event"
                :style="{ width: '50vw' }"
            >
                <div>
                    <form @submit.prevent="submit" class="gap-y-5">
                        <fieldset class="radios mb-7">
                            <legend>Feedback Status</legend>
                            <div v-for="feedback_status in feedback_statuses">
                                <RadioButton
                                    v-model="form.status"
                                    :inputId="feedback_status.value"
                                    name="feedback_status"
                                    :value="feedback_status.value"
                                />
                                <label :for="feedback_status.value">{{
                                    feedback_status.name
                                }}</label>
                            </div>
                        </fieldset>

                        <div class="form-row">
                            <label for="notes">Note</label>
                            <Editor
                                id="notes"
                                v-model="form.notes"
                                editorStyle="height: 320px"
                            />
                        </div>
                        <div class="mt-4">
                            <Button
                                class="save-btn"
                                label="Save Feedback"
                                icon="pi pi-save"
                                type="submit"
                                :disabled="form.processing"
                            />
                        </div>
                    </form>
                </div>
            </Dialog>
        </div>
    </div>
</template>

<script setup>
import { Link, usePage, useForm } from "@inertiajs/vue3";
import { computed, ref } from "vue";

import Button from "primevue/button";
import Dialog from "primevue/dialog";
import RadioButton from "primevue/radiobutton";
import Editor from "primevue/editor";

const form = useForm({
    status: "",
    notes: "",
});

function submit() {
    form.transform((data) => ({ interview_feedback: data }));
    form.post(`/interviews/${interview_id}/interview_feedbacks`);
    visible.value = false;
    form.reset();
}

const visible = ref(false);

const { interview_id } = defineProps({
    feedback_statuses: Array,
    candidate_id: Number,
    interview_id: Number,
});
</script>

<style scoped>
.form-row {
    display: flex;
    flex-direction: column;
    margin-bottom: 1rem;
}

.radios {
    border: 1px solid var(--color-gray-200);
    border-radius: 5px;
    padding: 2px;
    margin-bottom: 1rem;
}

.action-btn {
    background-color: var(--color-indigo-400);
    border: none;
}

.save-btn {
    background-color: orangered;
    border: none;
}
</style>
