<template>
    <div>
        <Button label="Assign Status" @click="visible = true" class="status-btn" />
    </div>
    <div>
        <Dialog v-model:visible="visible" header="Assign Status" @update:visble="visible = $event">
            <form @submit.prevent="submit">
                <fieldset class="radios">
                    <legend>Status</legend>
                    <div class="flex gap-x-2">
                        <div class="flex">
                            <RadioButton v-model="form.status" inputId="status" name="status" value="rejected" />
                            <label for="status">Rejected </label>
                        </div>
                        <div class="flex">
                            <RadioButton v-model="form.status" inputId="status" name="status" value="offer" />
                            <label for="status">Offer </label>
                        </div>
                    </div>
                </fieldset>
                <div class="flex flex-col mt-2">
                    <label for="reason">Reason</label>
                    <Textarea id="notes" v-model="form.reason" rows="5" cols="30" />
                </div>
                <div class="flex flex-col mt-2">
                    <label for="notes">Reason Document</label>
                    <input type="file" id="reason_notes" @change="form.reason_doc = $event.target.files[0]" />

                </div>
                <div class="mt-4">
                    <Button class="action-btn" label="Submit Status" icon="pi pi-save" type="submit"
                        :disabled="form.processing" />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
const { job_applicant_id } = defineProps({
    job_applicant_id: Number,
});

import { useForm } from "@inertiajs/vue3";
import { Textarea, Button, RadioButton, Dialog } from "primevue";
import { ref } from "vue";

const visible = ref(false);

const form = useForm({
    status: "",
    reason: "",
    reason_doc: null,
});

function submit() {
    form.transform((data) => ({
        candidate_status: {
            status: data.status,
            reason: data.reason,
        },
    })).post(`/job_applicants/${job_applicant_id}/status`);
    visible.value = false;
    form.reset();
}
</script>

<style scoped>
.status-btn {
    background-color: var(--color-indigo-500);
    border: none;
}

.action-btn {
    background-color: orangered;
    border: none;
}

.radios {
    border: 1px solid var(--color-gray-200);
    border-radius: 5px;
    padding: 2px;
    display: flex;
    align-items: center;
    padding: 12px;
}
</style>
