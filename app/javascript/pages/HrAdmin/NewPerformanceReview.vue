<template>
    <div>
        <div>
            <Button
                label="New Performance Review"
                icon="pi pi-plus"
                @click="visible = true"
                class="btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Performance Review"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="savePerformanceReview">
                <div class="flex flex-col mb-2">
                    <label class="label" for="name">Name</label>
                    <InputText name="name" id="name" v-model="form.name" />
                    <div v-if="form.errors.name" class="error">
                        {{ form.errors.name.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <Select
                        placeholder="Review Type"
                        :options="performance_review_types"
                        optionLabel="name"
                        optionValue="id"
                        v-model="form.performance_review_type_id"
                        @change="review_type = $event.value"
                    />
                    <div
                        v-if="form.errors.performance_review_type_id"
                        class="error"
                    >
                        {{ form.errors.performance_review_type_id.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="opens_on">Opens On</label>
                    <input
                        type="date"
                        class="form-control"
                        name="opens_on"
                        id="opens_on"
                        v-model="form.opens_on"
                    />
                    <div v-if="form.errors.opens_on" class="error">
                        {{ form.errors.opens_on.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="serial_number">Closes On</label>
                    <input
                        type="date"
                        class="form-control"
                        name="closes_on"
                        id="closes_on"
                        v-model="form.closes_on"
                    />
                    <div v-if="form.errors.closes_on" class="error">
                        {{ form.errors.closes_on.join(", ") }}
                    </div>
                </div>

                <div>
                    <Button
                        class="btn"
                        type="submit"
                        :disabled="form.processing"
                        label="Save Performance Review"
                        icon="pi pi-save"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import { Dialog, Select, InputText, Button, DatePicker } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const form = useForm({
    name: "",
    opens_on: "",
    closes_on: "",
    performance_review_type_id: "",
});

const visible = ref(false);

defineProps({
    performance_review_types: Array,
});

function savePerformanceReview() {
    form.transform((data) => ({ performance_review: data }));
    form.post(`/organizations/${org_id}/performance_reviews`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
