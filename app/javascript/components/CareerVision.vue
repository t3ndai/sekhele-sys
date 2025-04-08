<template>
    <div class="career-vision-row">
        <div v-for="career_vision in career_visions" :key="career_vision.id">
            <div class="career-vision-card">
                <div class="timeline"> {{ career_vision.outline }}</div>
                <div class="name">{{ career_vision.name }}</div>
                <div class="description"> {{ career_vision.description }}</div>

            </div>
        </div>
    </div>
</template>

<script setup>

defineProps({
    career_visions: Array
})

</script>

<style scoped>
.career-vision-row {
    display: flex;
    flex-wrap: wrap;
    gap: 2rem
}

.career-vision-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
    background-color: #f9f9f9;

    .name {
        font-size: 1.2rem;
        font-weight: bold;
        font-family: 'Jura', sans-serif;
    }

    .description {
        font-size: 1rem;
        font-weight: lighter;
        font-family: 'Jura', sans-serif;
    }

    .timeline {
        font-size: 0.8rem;
        color: light-gray;
        font-weight: lighter;
        font-family: 'Jura', sans-serif;
        text-align: center;
    }
}
</style>