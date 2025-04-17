<template>
    <div class="page-section">
        <h3 class="heading belgrano-regular">Leave Balances</h3>

        <DataTable :value="leave_balances" tableStyle="min-width: 50rem">
            <Column field="name" header="Leave Type"></Column>
            <Column field="balance" header="Balance"></Column>
            <Column field="category" header="Category"></Column>
            <Column field="valid_from" header="Effective Date"></Column>
            <Column field="valid_to" header="Expires"></Column>
        </DataTable>
    </div>

    <div class="page-section">
        <h3 class="heading belgrano-regular">Upcoming Leave</h3>
        <DataTable :value="future_leaves" tableStyle="min-width: 50rem">
            <Column field="leave_type" header="Leave Type" />
            <Column field="duration" header="Duration (days)" />
            <Column field="date_from" header="Start Date" />
            <Column field="date_to" header="End Date" />
            <Column field="status" header="Status" />
        </DataTable>
    </div>

    <div class="page-section">
        <h3 class="heading belgrano-regular">Past Leave</h3>
        <DataTable :value="past_leaves" tableStyle="min-width: 50rem">
            <Column field="leave_type" header="Leave Type" />
            <Column field="duration" header="Duration (days)" />
            <Column field="date_from" header="Start Date" />
            <Column field="date_to" header="End Date" />
            <Column field="status" header="Status" />
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";

defineProps({
    past_leaves: Array,
    future_leaves: Array,
    leave_balances: Array,
});
</script>

<style scoped></style>
