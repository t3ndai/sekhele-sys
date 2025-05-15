<template>
    <div>
        <div>
            <Button
                label="Apply"
                icon="pi pi-plus"
                @click="visible = true"
                class="btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="Apply to Job"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveApplication">
                <div class="flex gap-x-2.5">
                    <div class="flex flex-col mb-2">
                        <label class="label" for="name">First Name</label>
                        <InputText
                            name="name"
                            id="name"
                            v-model="form.first_name"
                        />
                        <div v-if="form.errors.name" class="error">
                            {{ form.errors.first_name.join(", ") }}
                        </div>
                    </div>

                    <div class="flex flex-col mb-2">
                        <label class="label" for="middle_name"
                            >Middle Names</label
                        >
                        <InputText
                            name="name"
                            id="middle_name"
                            v-model="form.middle_name"
                        />
                        <div v-if="form.errors.name" class="error">
                            {{ form.errors.middle_name.join(", ") }}
                        </div>
                    </div>

                    <div class="flex flex-col mb-2">
                        <label class="label" for="last_name">Last Name</label>
                        <InputText
                            name="name"
                            id="last_name"
                            v-model="form.last_name"
                        />
                        <div v-if="form.errors.name" class="error">
                            {{ form.errors.last_name.join(", ") }}
                        </div>
                    </div>
                </div>

                <div class="flex gap-x-2.5">
                    <div class="flex flex-col mb-2">
                        <label class="label" for="email">Email</label>
                        <InputText
                            type="email"
                            name="name"
                            id="email"
                            required
                            v-model="form.email"
                        />
                        <div v-if="form.errors.email" class="error">
                            {{ form.errors.email.join(", ") }}
                        </div>
                    </div>

                    <div class="flex flex-col mb-2">
                        <label class="label" for="phone">Phone</label>
                        <InputText
                            name="name"
                            id="phone"
                            v-model="form.phone"
                        />
                        <div v-if="form.errors.phone" class="error">
                            {{ form.errors.phone.join(", ") }}
                        </div>
                    </div>
                </div>

                <div class="flex flex-col mb-2">
                    <label class="label" for="cv">CV</label>
                    <input
                        type="file"
                        name="cv"
                        id="cv"
                        @change="form.cv = $event.target.files[0]"
                    />
                    <div v-if="form.errors.name" class="error">
                        {{ form.errors.last_name.join(", ") }}
                    </div>
                </div>

                <div class="flex flex-col mb-2">
                    <label class="label" for="other_files">Other Files</label>
                    <input
                        type="file"
                        name="other_files"
                        id="other_files"
                        :multiple
                        @change="form.other_files = $event.target.files"
                    />
                    <div v-if="form.errors.name" class="error">
                        {{ form.errors.last_name.join(", ") }}
                    </div>
                </div>

                <div>
                    <Button
                        class="btn"
                        type="submit"
                        :disabled="form.processing"
                        label="Submit Application"
                        icon="pi pi-save"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import { Dialog, InputText, Button } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const { job_posting } = defineProps({
    job_posting: Object,
});

const form = useForm({
    first_name: "",
    last_name: "",
    middle_name: "",
    cv: "",
    other_files: "",
    email: "",
    phone: "",
});

const visible = ref(false);

function saveApplication() {
    form.transform((data) => ({ job_applicant: data }));
    form.post(`/organizations/${org_id}/jobs/${job_posting.id}/apply`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.btn {
    background-color: var(--color-indigo-500);
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
