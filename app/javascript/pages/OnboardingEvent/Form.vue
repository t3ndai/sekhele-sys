<template>
  <form @submit.prevent="emit('onSubmit', form)">
    <div>
      <label class="label" for="new_joiner">Location</label>
      <input type="text" name="new_joiner" id="new_joiner" v-model="form.location" required />
      <div v-if="form.errors.location" class="error">
        {{ form.errors.location.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="contact">Contact</label>
      <Select :options="contacts" optionLabel="name" optionValue="id" type="text" name="contact" id="contact"
        v-model="form.contact_id" filter placeholder="Select Contact" required />
      <div v-if="form.errors.contact_id" class="error">
        {{ form.errors.contact_id.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="on">On</label>
      <input type="date" name="on" id="on" v-model="form.on" required />
      <div v-if="form.errors.on" class="error">
        {{ form.errors.on.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="at">At</label>
      <input type="time" name="at" id="at" v-model="form.at" required />
      <div v-if="form.errors.at" class="error">
        {{ form.errors.at.join(', ') }}
      </div>
    </div>
    <div>
      <label class="label" for="instruction">Instructions</label>
      <textarea name="instruction" id="instruction" v-model="form.instructions" />
      <div v-if="form.errors.instructions" class="error">
        {{ form.errors.instructions.join(', ') }}
      </div>
    </div>
    <div>
      <button type="submit" :disabled="form.processing || formInvalid" class="btn btn-primary">
        {{ submitText }}
      </button>
    </div>
  </form>
</template>

<script setup>
import { useForm } from '@inertiajs/vue3'
import Select from 'primevue/select'
import { computed } from 'vue'

const { onboarding_event, submitText, contacts } = defineProps(['onboarding_event', 'submitText', 'contacts'])
const emit = defineEmits(['onSubmit'])

const formInvalid = computed(() => !form.contact_id || !form.on || !form.at || !form.instructions)

const form = useForm({
  contact_id: onboarding_event.contact_id || '',
  on: onboarding_event.on || '',
  at: onboarding_event.at || '',
  instructions: onboarding_event.instructions || '',
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
