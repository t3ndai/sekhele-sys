<template>
    <h2 class="page-heading">Departments & Locations Admin</h2>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Departments</h3>
            <NewDepartment />
        </div>
        <DataTable :value="departments">
            <Column field="name" header="Name"></Column>
        </DataTable>
    </div>
    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Locations</h3>
            <NewLocation />
        </div>
        <DataTable :value="locations">
            <Column field="name" header="Name"></Column>
            <Column field="address" header="Address"></Column>
            <Column field="city" header="City"></Column>
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import NewDepartment from "./NewDepartment.vue";
import NewLocation from "./NewLocation.vue";

defineProps({
    departments: Array,
    locations: Array,
});
</script>

<style scoped>
.subsection {
    display: flex;
    justify-content: space-between;
    align-items: baseline;
    padding: 12px;
}
</style>
