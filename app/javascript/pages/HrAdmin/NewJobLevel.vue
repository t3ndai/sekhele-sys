<template>
    <div>
        <div>
            <Button
                label="New Job Level"
                icon="pi pi-plus"
                @click="visible = true"
                class="joblevel-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Job Level"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveJobLevel">
                <div class="flex flex-col mb-2">
                    <label class="label" for="name">Name</label>
                    <InputText name="name" id="name" v-model="form.name" />
                    <div v-if="form.errors.name" class="error">
                        {{ form.errors.name.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <Select
                        placeholder="Select Job Function"
                        :options="job_functions"
                        optionLabel="title"
                        optionValue="id"
                        v-model="form.job_function_id"
                        @change="job_function_id = $event.value"
                    />
                    <div v-if="form.errors.job_function_id" class="error">
                        {{ form.errors.job_function_id.join(", ") }}
                    </div>
                </div>

                <div class="flex flex-col mb-2">
                    <label class="label" for="serial_number"
                        >Minimum Salary</label
                    >
                    <InputNumber
                        name="salary_range_min"
                        id="salary_range_min"
                        v-model="form.salary_range_min"
                    />
                    <div v-if="form.errors.salary_range_min" class="error">
                        {{ form.errors.salary_range_min.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="serial_number"
                        >Maximum Salary</label
                    >
                    <InputNumber
                        name="salary_range_max"
                        id="salary_range_max"
                        v-model="form.salary_range_max"
                    />
                    <div v-if="form.errors.salary_range_max" class="error">
                        {{ form.errors.salary_range_max.join(", ") }}
                    </div>
                </div>
                <div>
                    <Button
                        class="joblevel-btn"
                        type="submit"
                        :disabled="form.processing"
                        label="Save Job Level"
                        icon="pi pi-save"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import { Dialog, Select, InputText, Button, InputNumber } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const form = useForm({
    name: "",
    salary_range_min: "",
    salary_range_max: "",
    job_function_id: "",
});

const visible = ref(false);
const job_function_id = ref(null);

defineProps({
    job_functions: Array,
});

function saveJobLevel() {
    form.transform((data) => ({ job_level: data }));
    form.post(`/job_functions/${job_function_id.value}/job_levels`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.joblevel-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
