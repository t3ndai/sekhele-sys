<template>
    <div class="flex flex-col gap-y-12">
        <h2 class="heading belgrano-regular mb-8">My 1-1s</h2>
        <div v-for="one_to_one in one_to_ones">
            <div class="card">
                <div class="time-header">{{ one_to_one.meeting_on }}</div>
                <div v-html="one_to_one.note"></div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { Link, usePage } from "@inertiajs/vue3";
import { computed } from "vue";
import DataTable from "primevue/datatable";
import Column from "primevue/column";

defineProps({
    reports: Array,
    one_to_ones: Array,
});
</script>

<style scoped>
.card {
    border: 1px solid #ccc;
    border-radius: 8px;
    background-color: #f9f9f9;
    padding: 0.5rem;
    font-family: "Jura", sans-serif;
    font-weight: 400;
    font-size: 1.2rem;
    display: flex;
    flex-direction: column;
    margin-bottom: 1.75rem;

    .time-header {
        color: var(--color-amber-600);
        font-weight: 100;
    }
}
</style>
