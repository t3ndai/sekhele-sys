<template>
    <h2 class="page-heading">Recruiting Admin</h2>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Interview Stages</h3>
            <div>
                <NewInterviewStage :stage_types />
            </div>
        </div>

        <DataTable :value="interview_stages" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
            <Column field="stage_type" header="Stage Type"></Column>
            <Column field="mandatory" header="Mandatory"></Column>
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import NewInterviewStage from "./NewInterviewStage.vue";

defineProps({
    interview_stages: Array,
    stage_types: Array,
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
