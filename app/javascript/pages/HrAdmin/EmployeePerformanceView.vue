<template>
    <div>
        <div class="page-section">
            <h3 class="heading belgrano-regular">Performance Reviews</h3>
            <DataTable
                :value="performance_reviews"
                tableStyle="min-width: 50rem"
            >
                <Column field="type" header="Review Type" />
                <Column field="reviewer" header="Reviewer" />
                <Column header="Answers">
                    <template #body="{ data }">
                        <div v-for="answer in data.answers" class="answer-card">
                            <span class="label"> {{ answer.question }}: </span>
                            {{ answer.answer }}
                        </div>
                    </template>
                </Column>
            </DataTable>
        </div>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";

defineProps({
    performance_reviews: Array,
});
</script>

<style scoped>
.answer-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
    background-color: #f9f9f9;

    .label {
        color: var(--color-slate-400);
        font-weight: 100;
    }

    .value {
        color: var(--color-slate-800);
        font-weight: 500;
    }
}
</style>
