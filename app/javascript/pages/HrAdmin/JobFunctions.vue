<template>
    <h2 class="page-heading">Job Functions</h2>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Job Functions</h3>
            <div>
                <NewJobFunction :departments />
            </div>
        </div>

        <DataTable
            :value="job_functions"
            paginator
            :rows="5"
            tableStyle="min-width: 50rem"
        >
            <Column field="title" header="Title"></Column>
            <Column field="department" header="Department"></Column>
            <Column field="salary_range" header="Salary Range"></Column>
        </DataTable>
    </div>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Job Levels</h3>
            <div>
                <!--<NewAsset :asset_categories />-->
            </div>
        </div>

        <DataTable
            :value="job_levels"
            paginator
            :rows="5"
            tableStyle="min-width: 50rem"
        >
            <Column field="name" header="Name"></Column>
            <Column field="job_function" header="Job Function"></Column>
            <Column field="salary_range" header="Salary Range"></Column>
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import NewJobFunction from "./NewJobFunction.vue";

defineProps({
    job_functions: Array,
    job_levels: Array,
    departments: Array,
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
