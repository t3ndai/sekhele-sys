<template>
    <h2 class="page-heading">Assets Admin</h2>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Assets</h3>
            <div>
                <NewAsset :asset_categories />
            </div>
        </div>

        <DataTable :value="assets" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
            <Column field="category" header="Category"></Column>
            <Column field="serial_number" header="Serial Number"></Column>
            <Column field="status" header="Status"></Column>
        </DataTable>
    </div>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Asset Categories</h3>
            <div>
                <NewAssetCategory />
            </div>
        </div>

        <DataTable :value="asset_categories" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
        </DataTable>
    </div>
</template>

<script setup>
import NewAssetCategory from "./NewAssetCategory.vue";
import NewAsset from "./NewAsset.vue";
import DataTable from "primevue/datatable";
import Column from "primevue/column";

defineProps({
    asset_categories: Array,
    assets: Array,
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
