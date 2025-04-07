<template>
    <div>
        <div v-for="motivation in motivations" :key="motivation.id">
            <div class="motivation-card">
                <div class="name">{{ motivation.name }}</div>
                <div class="description"> {{ motivation.description }}</div>

            </div>
        </div>
    </div>
</template>

<script setup>

defineProps({
    motivations: Array
})

</script>

<style scoped>
.motivation-card {
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