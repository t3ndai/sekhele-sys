<template>
  <form @submit.prevent="emit('onSubmit', form)">
    <div>
      <label class="label" for="job_function">Job function</label>
      <input type="text" name="job_function" id="job_function" v-model="form.job_function_id" />
      <div v-if="form.errors.job_function_id" class="error">
        {{ form.errors.job_function_id.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="employee">Employee</label>
      <input type="text" name="employee" id="employee" v-model="form.employee_id" />
      <div v-if="form.errors.employee_id" class="error">
        {{ form.errors.employee_id.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="job_level">Job level</label>
      <input type="text" name="job_level" id="job_level" v-model="form.job_level_id" />
      <div v-if="form.errors.job_level_id" class="error">
        {{ form.errors.job_level_id.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="started_on">Started on</label>
      <input type="date" name="started_on" id="started_on" v-model="form.started_on" />
      <div v-if="form.errors.started_on" class="error">
        {{ form.errors.started_on.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="ended_on">Ended on</label>
      <input type="date" name="ended_on" id="ended_on" v-model="form.ended_on" />
      <div v-if="form.errors.ended_on" class="error">
        {{ form.errors.ended_on.join(', ') }}
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

const { employee_job, submitText } = defineProps(['employee_job', 'submitText'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  job_function_id: employee_job.job_function_id || '',
  employee_id: employee_job.employee_id || '',
  job_level_id: employee_job.job_level_id || '',
  started_on: employee_job.started_on || '',
  ended_on: employee_job.ended_on || '',
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
