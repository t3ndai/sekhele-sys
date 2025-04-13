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
            >
                <div>
                    <form>
                        <div v-for="interview_stage in inteview_stages">
                            <!--<RadioButton
                                v-model="form.interview_stage_id"
                                :inputId="interview_stage.id"
                                name="dynamic"
                                :value="inteview.id"
                            />
                            <label :for="interview_stage.id">{{
                                interview_stage.name
                            }}</label> -->
                        </div>
                        <div>
                            <label for="interview_on">Interview On</label>
                            <DatePicker v-model="form.interview_on" />
                        </div>
                        <div>
                            <label for="inteview_at">Interview At</label>
                            <DatePicker
                                id="interview_at"
                                v-model="form.interview_at"
                                timeOnly
                                fluid
                            />
                        </div>
                        <div>
                            <label for="meeting_link">Meeting Link</label>
                            <InputText
                                id="meeting_link"
                                v-model="form.meeting_link"
                            />
                        </div>
                        <div>
                            <label for="room">Room</label>
                            <InputText id="room" v-model="form.room" />
                        </div>
                        <div>
                            <label for="location">Location</label>
                            <InputText id="location" v-model="form.location" />
                        </div>
                        <div>
                            <label for="notes">Note</label>
                            <Textarea
                                id="notes"
                                v-model="form.note"
                                rows="5"
                                cols="30"
                            />
                        </div>
                        <div>
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
import DatePicker from "primevue/datepicker";
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

const visible = ref(false);
</script>
