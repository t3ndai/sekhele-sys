<template>
    <Button severity="secondary" @click="showPlanDetails">
        Details
    </Button>

    <Dialog v-model:visible="visible" :modal="true" :header="`Benefit Plan`" :style="{ width: '50vw' }">
        <template #header>
            <h2>Benefit Plan</h2>
        </template>

        <div>
            <h3>Plan Name: {{ plan.name }}</h3>
            <p>Plan Covers: {{ plan.cover }}</p>
            <p>Employee Contribution: {{ plan.employee_contribution }}</p>
        </div>
        <div>
            <p>Plan Documents</p>
            <ul>
                <li v-for="document in plan.documents" :key="document.id">
                    <a :href="document.url" target="_blank">{{ document.name }}</a>
                </li>
            </ul>
        </div>

    </Dialog>

</template>

<script setup>
import { Link } from '@inertiajs/vue3'
import Button from 'primevue/button'
import Dialog from 'primevue/dialog';


defineProps({
    plan: {
        type: Object,
        required: true
    }
})

const visible = defineModel({

    type: Boolean,
    default: false

})

function showPlanDetails() {
    visible.value = true
}

</script>