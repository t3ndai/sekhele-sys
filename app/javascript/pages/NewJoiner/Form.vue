<template>
  <form @submit.prevent="emit('onSubmit', form)" class="space-y-4">
    <div>
      <label class="label" for="start_date">Start date</label>
      <input class="form-control" type="date" name="start_date" id="start_date" v-model="form.start_date" required />
      <div v-if="form.errors.start_date" class="error">
        {{ form.errors.start_date.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="manager">Manager</label>
      <Select :options="managers" optionValue="id" optionLabel="name" name="manager" id="manager" filter
        placeholder="Select Manager" v-model="form.manager_id" required />
      <div v-if="form.errors.manager_id" class="error">
        {{ form.errors.manager_id.join(', ') }}
      </div>
    </div>
    <div>
      <button type="submit" :disabled="form.processing || !form.start_date || !form.manager_id" class="btn btn-primary">
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'
import Select from 'primevue/select'

const { new_joiner, submitText, managers } = defineProps(['new_joiner', 'submitText', 'managers'])
const emit = defineEmits(['onSubmit'])

const form = useForm({
  start_date: new_joiner.start_date || '',
  manager_id: new_joiner.manager_id || '',
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
