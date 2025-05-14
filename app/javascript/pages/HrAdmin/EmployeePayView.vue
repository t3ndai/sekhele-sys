<template>
    <div class="flex justify-end mb-4">
        <div>
            <NewEmployeePay
                :currency_options
                :pay_type_options
                :frequency_options
            />
        </div>
    </div>
    <div>
        <div v-for="pay in employee_pays" class="job-card gap-y-7">
            <div class="flex gap-x-11 mb-2">
                <div class="value">
                    <span class="label">Amount:</span> {{ pay.amount }}
                </div>
                <div class="value">
                    <span class="label">Currency:</span>{{ pay.currency }}
                </div>
            </div>
            <div class="flex gap-x-11 mb-2">
                <div class="value">
                    <span class="label">Pay Type:</span>{{ pay.pay_type }}
                </div>
                <div class="value">
                    <span class="label">Frequency:</span>{{ pay.frequency }}
                </div>
            </div>
            <div class="value mb-2">
                <span class="label">Started On:</span>{{ pay.start_date }}
            </div>
            <div class="value">
                <span class="label">Ended On:</span>{{ pay.end_date }}
            </div>
        </div>
    </div>
</template>

<script setup>
import NewEmployeePay from "./NewEmployeePay.vue";

defineProps({
    currency_options: Array,
    pay_type_options: Array,
    frequency_options: Array,
    employee_pays: Array,
});
</script>

<style scoped>
.job-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
    background-color: #f9f9f9;

    .label {
        color: var(--color-slate-400);
        font-weight: 100;
    }

    .value {
        color: var(--color-slate-800);
        font-weight: 500;
    }
}
</style>
