<template>
    <div>
        <h2 class="page-heading">Benefit View</h2>
        <div class="belgrano-regular text-2xl text-center">
            {{ benefit.name }}
        </div>
        <div class="flex gap-x-2 place-self-center">
            <p class="belgrano-regular text-lg">
                {{ benefit.valuation_type }}
            </p>
            |
            <p class="belgrano-regular text-lg">
                {{ benefit.type }}
            </p>
        </div>

        <div class="flex justify-between mb-2">
            <div class="belgrano-regular text-2xl">Plans</div>

            <div class="flex gap-x-2">
                <NewBenefitPlan :benefit :cover_types />
            </div>
        </div>

        <DataTable :value="benefit_plans" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
            <Column
                field="employee_contribution"
                header="Employee Contribution"
            ></Column>
            <Column
                field="employer_contribution"
                header="Employer Contribution"
            ></Column>

            <Column field="cover" header="Covers"></Column>
            <Column header="Actions">
                <template #body="slotProps">
                    <div class="flex gap-x-2">
                        <!--<BenefitPlan :plan="slotProps.data" />
                        <ElectBenefit
                            :benefit="benefit"
                            :plan="slotProps.data"
                        />-->
                    </div>
                </template>
            </Column>
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import Button from "primevue/button";
import NewBenefitPlan from "./NewBenefitPlan.vue";

//import BenefitPlan from "./BenefitPlan.vue";
//import ElectBenefit from "./ElectBenefit.vue";

defineProps({
    benefit: Object,
    benefit_plans: Array,
    cover_types: Array,
});
</script>
