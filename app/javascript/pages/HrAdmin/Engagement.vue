<template>
    <h2 class="page-heading">Engagement Admin</h2>

    <div class="page-section">
        <div class="subsection">
            <h3 class="heading belgrano-regular">Pulse Surveys</h3>
            <div>
                <NewPulseSurvey />
            </div>
        </div>

        <DataTable :value="pulse_surveys" tableStyle="min-width: 50rem">
            <Column field="name" header="Name"></Column>
            <Column field="date_open" header="Date Open"></Column>
            <Column field="date_close" header="Date Close"></Column>
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";
import NewPulseSurvey from "./NewPulseSurvey.vue";

defineProps({
    pulse_surveys: Array,
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
