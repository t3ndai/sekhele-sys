<script setup>
defineProps({
  leave_balances: Array,
})
</script>

<template>
  <h1>EmployeeDashboard#show</h1>
  <p>Find me in app/javascript/pages/EmployeeDashboard/Show.vue</p>
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

    </div>
  </div>
</template>
