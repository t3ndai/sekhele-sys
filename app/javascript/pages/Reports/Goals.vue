<template>
    <h2 class="heading belgrano-regular">{{ report.name }}'s Goals</h2>

    <Goals :goals="goals" />

    <Button
        label="Back to Reports"
        icon="pi pi-arrow-left"
        class="p-button-outlined"
        @click="backToReports"
    />
</template>

<script setup>
import Goals from "../../components/Goals.vue";
import Button from "primevue/button";

defineProps({
    goals: Array,
    report: Object,
});

function backToReports() {
    window.history.back();
}
</script>
