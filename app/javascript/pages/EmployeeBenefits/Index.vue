<template>
    <h2>Employee Benefits</h2>

    <div v-for="benefit in employee_benefits" :key="benefit.id">
        <Link :href="`/employees/${employee.id}/benefits/${benefit.id}`">
        <div>{{ benefit.name }}</div>
        </Link>
        <div>{{ benefit.valuation_type }}</div>

    </div>
</template>

<script setup>
import { Link } from '@inertiajs/vue3'
import { computed } from 'vue'
import { usePage } from '@inertiajs/vue3'

import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';
import Row from 'primevue/row';
import Button from 'primevue/button'

const page = usePage()
const employee = computed(() => page.props.employee)

defineProps({
    employee_benefits: Array
})


</script>