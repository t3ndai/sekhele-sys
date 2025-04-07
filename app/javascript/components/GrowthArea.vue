<template>
    <div class="growth-area-row">
        <div v-for="growth_area in growth_areas" :key="growth_area.id">
            <div class="growth-area-card">
                <div class="name">{{ growth_area.name }}</div>
                <div class="description"> {{ growth_area.description }}</div>

            </div>
        </div>
    </div>
</template>

<script setup>

defineProps({
    growth_areas: Array
})

</script>

<style scoped>
.growth-area-row {
    display: flex;
    flex-wrap: wrap;
    gap: 2rem
}

.growth-area-card {
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
}
</style>