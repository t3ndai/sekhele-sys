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

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Company Files</h3>
            <div>
                <NewCompanyFile :company_docs />
            </div>
        </div>

        <DataTable :value="company_files" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
            <Column>
                <template #body="slotProps">
                    <a :href="slotProps.data.url" target="_blank">View</a>
                </template>
            </Column>
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import NewDocument from "./NewDocument.vue";
import NewCompanyFile from "./NewCompanyFile.vue";

defineProps({
    documents: Array,
    company_files: Array,
    company_docs: Array,
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
