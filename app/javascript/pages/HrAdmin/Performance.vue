<template>
    <h2 class="page-heading">Performance Reviews Admin</h2>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Performance Reviews</h3>
            <div>
                <NewPerformanceReview :performance_review_types />
            </div>
        </div>

        <DataTable :value="performance_reviews" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
            <Column field="type" header="Type"></Column>
            <Column field="opens_on" header="Opens On"></Column>
            <Column field="closes_on" header="Closes On"></Column>
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import NewPerformanceReview from "./NewPerformanceReview.vue";

defineProps({
    performance_reviews: Array,
    performance_review_types: Array,
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
