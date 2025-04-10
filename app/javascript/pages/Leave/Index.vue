<template>
  <h2 class="page-heading">Leave</h2>
  <div class="actions">
    <RequestLeave :leave_policies />
  </div>

  <div class="page-section">
    <h2 class="heading belgrano-regular">Upcoming Leave</h2>
    <DataTable :value="future_leaves" tableStyle="min-width: 50rem">
      <Column field="leave_type" header="Leave Type" />
      <Column field="duration" header="Duration (days)" />
      <Column field="date_from" header="Start Date" />
      <Column field="date_to" header="End Date" />
      <Column field="status" header="Status" />
    </DataTable>
  </div>

  <div class="page-section">
    <h2 class="heading belgrano-regular">Past Leave</h2>
    <DataTable :value="past_leaves" tableStyle="min-width: 50rem">
      <Column field="leave_type" header="Leave Type" />
      <Column field="duration" header="Duration (days)" />
      <Column field="date_from" header="Start Date" />
      <Column field="date_to" header="End Date" />
      <Column field="status" header="Status" />
    </DataTable>
  </div>
</template>


<script setup>

import { Link } from '@inertiajs/vue3'
import { computed } from 'vue'
import { usePage } from '@inertiajs/vue3'

import RequestLeave from '../EmployeeDashboard/RequestLeave.vue'

import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';
import Row from 'primevue/row';
import Button from 'primevue/button'

const page = usePage()
const employee = computed(() => page.props.employee)

defineProps({
  past_leaves: Array,
  future_leaves: Array,
  leave_policies: Array,
})

</script>

<style scoped>
.actions {
  display: flex;
  flex-direction: column;
  margin-bottom: 2.5rem;
}
</style>