<template>
    <h2 class="page-heading">Benefits</h2>
    <div class="page-section">
        <h3 class="heading belgrano-regular">Current Benefits Selected</h3>
        <div>
            <DataTable :value="benefit_elections" tableStyle="min-width: 50rem">
                <Column field="benefit" header="Benefit"></Column>
                <Column field="benefit_plan" header="Benefit Plan"></Column>
                <Column field="cover" header="Covers"></Column>
                <Column field="cost" header="Cost"></Column>
            </DataTable>
        </div>
    </div>
    <div class="page-section">
        <h3 class="heading belgrano-regular">Benefits on Offer</h3>
        <div>
            <DataTable :value="employee_benefits" tableStyle="min-width: 50rem">
                <Column field="name" header="Name"></Column>
                <Column field="type" header="Type"></Column>
                <Column field="valuation_type" header="Valuation Type"></Column>
                <Column>
                    <template #body="{ data }, empoloyee">
                        <Button severity="secondary" asChild v-slot="slotProps">
                            <Link
                                :href="`/employees/${employee.id}/benefits/${data.id}`"
                                :class="slotProps.class"
                            >
                                View Plans
                            </Link>
                        </Button>
                    </template>
                </Column>
            </DataTable>
        </div>
    </div>
</template>

<script setup>
import { Link } from "@inertiajs/vue3";
import { computed } from "vue";
import { usePage } from "@inertiajs/vue3";

import DataTable from "primevue/datatable";
import Column from "primevue/column";
import ColumnGroup from "primevue/columngroup";
import Row from "primevue/row";
import Button from "primevue/button";

const page = usePage();
const employee = computed(() => page.props.employee);

defineProps({
    employee_benefits: Array,
    benefit_elections: Array,
});
</script>

<style scoped>
.heading {
    font-size: 2rem;
    font-weight: 400;
    color: #111509;
}
</style>
