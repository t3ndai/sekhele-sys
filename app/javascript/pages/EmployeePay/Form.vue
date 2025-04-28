<template>
  <form @submit.prevent="emit('onSubmit', form)">
    <div>
      <label class="label" for="employee">Employee</label>
      <input type="text" name="employee" id="employee" v-model="form.employee_id" />
      <div v-if="form.errors.employee_id" class="error">
        {{ form.errors.employee_id.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="start_date">Start date</label>
      <input type="date" name="start_date" id="start_date" v-model="form.start_date" />
      <div v-if="form.errors.start_date" class="error">
        {{ form.errors.start_date.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="end_date">End date</label>
      <input type="date" name="end_date" id="end_date" v-model="form.end_date" />
      <div v-if="form.errors.end_date" class="error">
        {{ form.errors.end_date.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="amount">Amount</label>
      <input type="number" name="amount" id="amount" v-model="form.amount" />
      <div v-if="form.errors.amount" class="error">
        {{ form.errors.amount.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="pay_type">Pay type</label>
      <input type="text" name="pay_type" id="pay_type" v-model="form.pay_type" />
      <div v-if="form.errors.pay_type" class="error">
        {{ form.errors.pay_type.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="currency">Currency</label>
      <input type="text" name="currency" id="currency" v-model="form.currency" />
      <div v-if="form.errors.currency" class="error">
        {{ form.errors.currency.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="frequency">Frequency</label>
      <input type="text" name="frequency" id="frequency" v-model="form.frequency" />
      <div v-if="form.errors.frequency" class="error">
        {{ form.errors.frequency.join(', ') }}
      </div>
    </div>
    <div>
      <button type="submit" :disabled="form.processing">
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'

const { employee_pay, submitText } = defineProps(['employee_pay', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  employee_id: employee_pay.employee_id || '',
  start_date: employee_pay.start_date || '',
  end_date: employee_pay.end_date || '',
  amount: employee_pay.amount || '',
  pay_type: employee_pay.pay_type || '',
  currency: employee_pay.currency || '',
  frequency: employee_pay.frequency || '',
})
</script>

<style scoped>
.label {
  display: block;
}
.error {
  color: red;
}
</style>
