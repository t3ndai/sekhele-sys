<template>
    <div v-for="goal in goals">
        <div class="goal-card">
            <div class="name">{{ goal.name }}</div>
            <div>Goal start: {{ goal.starts_on }}</div>
            <div>Goal end: {{ goal.ends_on }}</div>

            <h5> Milestones </h5>
            <div v-for="milestone in goal.milestones">
                <div>
                    <div>{{ milestone.name }}</div>
                    <div>Milestone start: {{ milestone.starts_on }}</div>
                    <div>Milestone end: {{ milestone.ends_on }}</div>
                </div>
            </div>

        </div>
    </div>
</template>

<script setup>

defineProps({
    goals: Array,
})
</script>

<style scoped>
.goal-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
    background-color: #f9f9f9;

    .name {
        font-size: 1.2rem;
        font-weight: bold;
        font-family: 'Belgrano', sans-serif;
    }
}

.milestone-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
    background-color: #f9f9f9;

    .name {
        font-size: 1.2rem;
        font-weight: bold;
        font-family: 'Belgrano', sans-serif;
    }
}
</style>