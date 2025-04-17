<template>
    <div class="benefit-card">
        <div v-for="benefit in benefits" class="flex flex-col gap-y-2">
            <div class="header">
                <div>
                    <span class="label">Benefit:</span>
                    {{ benefit.benefit }}
                </div>
                <div>
                    <span class="label">Benefit Plan:</span>
                    {{ benefit.benefit_plan }}
                </div>
                <div>
                    <span class="label">Benefit Plan:</span>
                    {{ benefit.benefit_type }}
                </div>
            </div>
            <div>
                <span class="label">Cover:</span>
                {{ benefit.cover }}
            </div>
            <div class="flex justify-between">
                <div>
                    <span class="label">Employee Contribution:</span>
                    {{ benefit.employee_contribution }}
                </div>
                <div>
                    <span class="label">Employer Contribution:</span>
                    {{ benefit.employer_contribution }}
                </div>
            </div>
            <div>
                <span class="label">Benefit Plan:</span>
                {{ benefit.valuation }}
            </div>
        </div>
    </div>
</template>

<script setup>
defineProps({
    benefits: Array,
});
</script>

<style scoped>
.benefit-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
    background-color: #f9f9f9;

    .header {
        display: flex;
        justify-content: space-between;
    }

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
