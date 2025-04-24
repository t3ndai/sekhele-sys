<template>
    <h2 class="page-heading">Documents Admin</h2>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Document Types</h3>
            <div>
                <NewDocument />
            </div>
        </div>

        <DataTable :value="documents" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
            <Column field="type" header="Type"></Column>
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import NewDocument from "./NewDocument.vue";

defineProps({
    documents: Array,
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
