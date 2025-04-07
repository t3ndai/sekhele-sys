<template>
    <div>
        <div v-for="talent in talents" :key="talent.id">
            <div class="talent-pill">
                <div class='name'> {{ talent.name }} </div>
                <div class="description"> {{ talent.description }}</div>
            </div>
        </div>
    </div>
</template>

<script setup>

defineProps({
    talents: Array
})

</script>

<style scoped>
.talent-pill {
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