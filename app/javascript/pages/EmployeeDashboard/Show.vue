<script setup>

import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';   // optional
import Row from 'primevue/row';                   // optional

defineProps({
  leave_balances: Array,
  tasks: Array
})
</script>

<template>
  <h2>I'm an Employee</h2>
  <p>My leave balances are:</p>
  <ul>
    <li v-for="leaveBalance in leave_balances" :key="leaveBalance.name">
      {{ leaveBalance.name }}: {{ leaveBalance.balance }}
      <div>
        Expires: {{ leaveBalance.expires }}
      </div>
      <div>
        {{ leaveBalance.category }}
      </div>
    </li>
  </ul>
  <div>
    <h2> TaskBox </h2>
    <div>
      <DataTable :value="tasks" tableStyle="min-width: 50rem">
        <Column field="title" header="Title"></Column>
        <Column field="assigned_by" header="Assigned By"></Column>
        <Column field="assigned_on" header="Assigned On"></Column>
        <Column field="status" header="Status"></Column>
        <Column field="due_on" header="Due On"></Column>
      </DataTable>
    </div>
  </div>
</template>
