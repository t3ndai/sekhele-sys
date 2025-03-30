<template>
    <div>
        <Button @click="showPlanDetails">
            Select Plan
        </Button>
        <Dialog v-model:visible="visible" :modal="true" :header="`Benefit Plan`" :style="{ width: '50vw' }">

            <h2 class="belgrano-regular"> Confirm {{ benefit.name }} Selection </h2>

            <div>
                <p>Selected Plan: {{ plan.name }}</p>
                <p>Plan Covers {{ plan.cover }}</p>
                <p>Plan Cost: {{ plan.employee_contribution }}</p>
            </div>

            <div>
                <Button label="Confirm" severity="success" @click="confirmSelection">
                    Confirm
                </Button>
                <Button label="Cancel" severity="danger" @click="cancelSelection">
                    Cancel
                </Button>
            </div>
        </Dialog>
    </div>

</template>

<script setup>

import { usePage } from '@inertiajs/vue3'
import { computed } from 'vue'

import Dialog from 'primevue/dialog';
import Button from 'primevue/button'
import { router } from '@inertiajs/vue3'

const page = usePage()
const employee = computed(() => page.props.employee)

const props = defineProps({
    benefit: {
        type: Object,
        required: true
    },
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
function confirmSelection() {
    // Logic to confirm the selection

    const { benefit, plan } = props

    const employee_id = employee.value.id

    router.post(`/employees/${employee_id}/benefits/${benefit.id}/benefit_plans/${plan.id}`)
    visible.value = false
}
function cancelSelection() {
    // Logic to cancel the selection
    visible.value = false
}


</script>