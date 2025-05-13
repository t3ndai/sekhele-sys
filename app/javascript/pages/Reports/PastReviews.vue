<template>
    <div class="text-4xl font-belgrano mb-10">
        {{ report.name }} Past Performance Reviews
    </div>

    <div>
        <DataTable :value="reviews" tableStyle="min-width: 50rem">
            <Column field="name" header="Review Name" />
            <Column field="type" header="Review Type" />
            <Column field="reviewer" header="Reviewer" />
            <Column header="Answers">
                <template #body="{ data }">
                    <div
                        v-for="(answer, question, idx) in data.response"
                        :key="idx"
                        class="answer-card"
                    >
                        <span class="label"> {{ question }}: </span>
                        {{ answer }}
                    </div>
                </template>
            </Column>
        </DataTable>
    </div>
</template>

<script setup>
import DataTable from "primevue/datatable";
import Column from "primevue/column";

defineProps({
    report: Object,
    reviews: Array,
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
