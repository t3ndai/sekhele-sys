<template>
    <h3> Goals </h3>
    <div v-for="goal in goals">
        <div>{{ goal.name }}</div>
        <div>Goal start: {{ goal.starts_on }}</div>
        <div>Goal end: {{ goal.ends_on }}</div>

        <h5> Milestones </h5>
        <div v-for="milestone in goal.milestones">
            <div>{{ milestone.name }}</div>
            <div>Milestone start: {{ milestone.starts_on }}</div>
            <div>Milestone end: {{ milestone.ends_on }}</div>
        </div>
    </div>
</template>

<script setup>

defineProps({
    goals: Array,
})
</script>