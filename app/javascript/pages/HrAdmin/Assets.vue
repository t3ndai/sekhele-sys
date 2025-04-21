<template>
    <h2 class="page-heading">Assets Admin</h2>

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
import { Link } from "@inertiajs/vue3";
import DataTable from "primevue/datatable";
import Column from "primevue/column";

defineProps({
    asset_categories: Array,
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
