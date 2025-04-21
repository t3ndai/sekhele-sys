<template>
    <h2 class="page-heading">Benefits Admin</h2>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Benefits</h3>
            <div>
                <NewBenefit :benefit_types />
            </div>
        </div>

        <DataTable :value="benefits" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
            <Column field="type" header="Benefit Type"></Column>
            <Column field="valuation_type" header="Valuation Type"></Column>
            <Column>
                <template #body="{ data }, empoloyee">
                    <Link :href="`/benefits/${data.id}`">
                        View Details & Plans
                    </Link>
                </template>
            </Column>
        </DataTable>
    </div>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Benefit Types</h3>
            <div>
                <NewBenefitType />
            </div>
        </div>

        <DataTable :value="benefit_types" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
        </DataTable>
    </div>
</template>

<script setup>
import { Link } from "@inertiajs/vue3";
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import NewBenefitType from "./NewBenefitType.vue";
import NewBenefit from "./NewBenefit.vue";

defineProps({
    benefits: Array,
    benefit_types: Array,
});
</script>

<style scoped>
.action-btn {
    background-color: orangered;
    border: none;
}

.subsection {
    display: flex;
    justify-content: space-between;
    align-items: baseline;
    padding: 12px;
}
</style>
