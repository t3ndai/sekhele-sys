<template>
    <div class="flex justify-evenly">
        <div>
            <div class="details mb-3">
                <div class="value">
                    <span class="label">First Name:</span>
                    {{ employee.first_name }}
                </div>
                <div class="value">
                    <span class="label">Last Name:</span
                    >{{ employee.last_name }}
                </div>
                <div class="value">
                    <span class="label">Preferred Name:</span>
                    {{ employee.preferred_name }}
                </div>
            </div>

            <div class="details mb-3">
                <div class="value">
                    <span class="label">Employment Id:</span>
                    {{ employee.employment_id }}
                </div>
                <div class="value">
                    <span class="label">National Id:</span>
                    {{ employee.id_number }}
                </div>
                <div class="value">
                    <span class="label">Passport #:</span>
                    {{ employee.passport_number }}
                </div>
            </div>

            <div class="details mb-3">
                <div class="value">
                    <span class="label">DOB:</span> {{ employee.dob }}
                </div>
                <div class="value">
                    <span class="label">Tenure:</span> {{ employee.tenure }}
                </div>
                <div class="value">
                    <span class="label">Hire Date:</span>
                    {{ employee.hire_date }}
                </div>
            </div>

            <div class="details">
                <div class="value">
                    <span class="label">Gender:</span>
                    {{ employee.gender }}
                </div>
            </div>
        </div>

        <Divider layout="vertical" />

        <div>
            <div class="details mb-3">
                <div class="value">
                    <span class="label">Work Email:</span>
                    {{ employee.work_email }}
                </div>

                <div class="value">
                    <span class="label">Personal Email:</span>
                    {{ employee.personal_email }}
                </div>
                <div class="value">
                    <span class="label">Phone1:</span> {{ employee.phone1 }}
                </div>

                <div class="value">
                    <span class="label">Phone2:</span> {{ employee.phone2 }}
                </div>
            </div>

            <div class="details">
                <div class="value">
                    <span class="label">Addr_line1:</span>
                    {{ employee.addr_line1 }}
                </div>
                <div class="value">
                    <span class="label">Addr_line2:</span>
                    {{ employee.addr_line2 }}
                </div>
                <div class="value">
                    <span class="label">City:</span> {{ employee.city }}
                </div>
                <div class="value">
                    <span class="label">Country:</span> {{ employee.country }}
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import Divider from "primevue/divider";

defineProps({
    employee: Object,
});
</script>

<style scoped>
.details {
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
