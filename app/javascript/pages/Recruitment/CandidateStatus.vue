<template>
    <div class="flex flex-col gap-y-4">

        <div class="text-2xl heading belgrano-regular">Status Details</div>

        <div class="details-card" v-if="candidate.status == 'Offer'">
            <div class="value">
                <span class="label">Offer On:</span>{{ offerDetails.offer_on }}
            </div>
            <div class="value">
                <span class="label">Offer By:</span>{{ offerDetails.offer_by }}
            </div>
            <div class="value">
                <span class="label">Reason File</span><a :href="offerDetails.reason_file" target="_blank"> View
                    Reason File </a>
            </div>
        </div>
        <div v-if="candidate.status == 'Offer'">
            <Button class="action-btn hover:bg-[#ffb59a]" @click="visible = true" icon="pi pi-check"
                label="Send Offer" />
        </div>
        <div>
            <Dialog v-model:visible="visible" header="Offer Details" @update:visible="visible = $event">
                <form @submit.prevent="submit">
                    <div class="flex flex-col">
                        <label for="offer_details">Offer Letter</label>
                        <input type="file" id="offer_details" @change="form.offer_letter = $event.target.files[0]" />
                    </div>
                    <div class="mt-4">
                        <Button class="action-btn" label="Submit Offer" icon="pi pi-save" type="submit"
                            :disabled="form.processing" />
                    </div>
                </form>
            </Dialog>
        </div>
    </div>

</template>

<script setup>
const { candidate } = defineProps({
    candidate: Object,
    offerDetails: Object,
})

import { useForm } from "@inertiajs/vue3";
import { Textarea, Button, Dialog } from "primevue";
import { ref } from "vue";

const visible = ref(false);

const form = useForm({
    offer_letter: null,
});

function submit() {
    form.transform((data) => ({
        candidate_status: data
    }))
        .post(`/job_applicants/${candidate.id}/send_offer`, {
            onSuccess: () => {
                visible.value = false;
            },
            onError: () => {
                console.error("Failed to submit offer details");
            }
        });
}


</script>

<style scoped>
.details-card {
    .label {
        color: var(--color-slate-400);
        font-weight: 100;
    }

    .value {
        color: var(--color-slate-800);
        font-weight: 500;
    }

    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
    padding: 0.5rem;
    width: 25vw;
}

.subsection {
    display: flex;
    justify-content: space-between;
    align-items: baseline;
    padding: 0.5rem;
}
</style>