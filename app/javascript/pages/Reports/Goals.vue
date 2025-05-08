<template>
    <div class="flex justify-between mb-5">
        <h2 class="heading belgrano-regular">{{ report.name }}'s Goals</h2>
        <div>
            <NewGoal :report />
        </div>
    </div>

    <Goal :goals="goals" />

    <Button
        label="Back to Reports"
        icon="pi pi-arrow-left"
        class="p-button-outlined"
        @click="backToReports"
    />
</template>

<script setup>
import Goals from "../../components/Goals.vue";
import Goal from "./Goal.vue";
import Button from "primevue/button";
import NewGoal from "./NewGoal.vue";

defineProps({
    goals: Array,
    report: Object,
});

function backToReports() {
    window.history.back();
}
</script>
