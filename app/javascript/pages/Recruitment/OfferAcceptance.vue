<template>
    <div>
        <div class="flex flex-col gap-y-4">
            <div class="text-2xl heading belgrano-regular">Congrats for {{ job }}</div>
            <div class="text-lg font-belgrano">{{ candidate.name }}</div>
            <div class="text-lg font-belgrano">Please upload your offer letter to accept the offer.</div>
            <div class="text-lg font-belgrano">Once you upload the offer letter, we will process your acceptance.</div>
            <div class="text-lg font-belgrano">If you have any questions, please contact us.</div>
            <div class="text-lg font-belgrano">Thank you!</div>
            <div class="text-lg font-belgrano">Werk by Sekhele Team</div>
            <div class="text-lg font-belgrano">
                <a href="https://werk.sekhele.com" target="_blank" class="text-blue-500">Sekhele</a>
            </div>
        </div>
    </div>
    <div>
        <form @submit.prevent="submit">
            <div class="flex flex-col">
                <label for="offer_letter">Offer Letter</label>
                <input type="file" id="offer_letter" @change="form.offer_letter_signed = $event.target.files[0]" />
            </div>
            <div class="mt-4">
                <Button class="action-btn" label="Accept Offer" icon="pi pi-save" type="submit"
                    :disabled="form.processing || !form.offer_letter_signed" />
            </div>
        </form>
    </div>
</template>

<script setup>
const { candidate } = defineProps({
    candidate: String,
    job: String,
})

import { useForm } from "@inertiajs/vue3";
import Button from "primevue/button";
import { ref } from "vue";

const form = useForm({
    offer_letter_signed: null,
});

function submit() {
    form
        .transform((data) => ({
            candidate_status: data
        }))
        .post(`/job_applicants/${candidate.id}/accept_offer`, {
            onSuccess: () => form.reset(),
        });
}


</script>