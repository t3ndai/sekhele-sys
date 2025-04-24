<template>
    <h2 class="page-heading">Leave Admin</h2>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Leave Policies</h3>
            <div>
                <NewLeavePolicy :leave_categories />
            </div>
        </div>

        <DataTable :value="leave_policies" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
            <Column field="category" header="Category"></Column>
            <Column field="start_balance" header="Start Balance"></Column>
            <Column field="valid_from" header="Valid From"></Column>
            <Column field="valid_to" header="Valid To"></Column>
        </DataTable>
    </div>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Leave Categories</h3>
            <div>
                <NewLeaveCategory />
            </div>
        </div>

        <DataTable :value="leave_categories" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import NewLeaveCategory from "./NewLeaveCategory.vue";
import NewLeavePolicy from "./NewLeavePolicy.vue";

defineProps({
    leave_categories: Array,
    leave_policies: Array,
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
