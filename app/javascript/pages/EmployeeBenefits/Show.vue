<template>
    <div>
        <h2 class="belgrano-regular">{{ benefit.name }} Plans</h2>

        <DataTable :value="benefit_plans" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
            <Column
                field="employee_contribution"
                header="Employee Contribution"
            ></Column>
            <Column field="cover" header="Covers"></Column>
            <Column header="Actions">
                <template #body="slotProps">
                    <div class="flex gap-x-2">
                        <BenefitPlan :plan="slotProps.data" />
                        <ElectBenefit
                            :benefit="benefit"
                            :plan="slotProps.data"
                        />
                    </div>
                </template>
            </Column>
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import BenefitPlan from "./BenefitPlan.vue";
import ElectBenefit from "./ElectBenefit.vue";

defineProps({
    benefit: Object,
    benefit_plans: Array,
});
</script>
