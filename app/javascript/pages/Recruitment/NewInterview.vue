<template>
    <div>
        <div>
            <Button
                label="New Interview"
                icon="pi pi-plus"
                class="action-btn"
                @click="visible = true"
            />
        </div>

        <div>
            <Dialog
                v-model:visible="visible"
                header="New Interview"
                @update:visible="visible = $event"
                :style="{ width: '25vw' }"
            >
                <div>
                    <form @submit.prevent="submit" class="gap-y-5">
                        <fieldset class="radios mb-7">
                            <legend>Interview Stage</legend>
                            <div v-for="interview_stage in interview_stages">
                                <RadioButton
                                    v-model="form.interview_stage_id"
                                    :inputId="interview_stage.id"
                                    name="interview_stage"
                                    :value="interview_stage.id"
                                />
                                <label :for="interview_stage.id">{{
                                    interview_stage.name
                                }}</label>
                            </div>
                        </fieldset>
                        <div class="form-row mb-2 gap-y-0.5">
                            <label for="interview_on">Interview On</label>
                            <input
                                type="date"
                                class="form-control"
                                v-model="form.interview_on"
                            />
                        </div>
                        <div class="form-row">
                            <label for="inteview_at">Interview At</label>
                            <input
                                type="time"
                                id="interview_at"
                                v-model="form.interview_at"
                                class="form-control"
                            />
                        </div>
                        <div class="form-row">
                            <label for="meeting_link">Meeting Link</label>
                            <InputText
                                id="meeting_link"
                                v-model="form.meeting_link"
                            />
                        </div>
                        <div class="form-row">
                            <label for="room">Room</label>
                            <InputText id="room" v-model="form.room" />
                        </div>
                        <div class="form-row">
                            <label for="location">Location</label>
                            <InputText id="location" v-model="form.location" />
                        </div>
                        <div class="form-row">
                            <label for="notes">Note</label>
                            <Textarea
                                id="notes"
                                v-model="form.note"
                                rows="5"
                                cols="30"
                            />
                        </div>
                        <div class="mt-4">
                            <Button
                                class="action-btn"
                                label="Create Interview"
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
import Textarea from "primevue/textarea";
import RadioButton from "primevue/radiobutton";
import InputText from "primevue/inputtext";

const form = useForm({
    interview_stage_id: "",
    interview_on: "",
    interview_at: "",
    meeting_link: "",
    room: "",
    location: "",
    note: "",
});

function submit() {
    form.post(`/job_applicants/${candidate_id}/interviews`);
    visible.value = false;
    form.reset();
}

const visible = ref(false);

const { candidate_id } = defineProps({
    interview_stages: Array,
    candidate_id: Number,
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
    background-color: orangered;
    border: none;
}
</style>
