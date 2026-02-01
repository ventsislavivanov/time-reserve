import { useEffect } from "react";
import { useForm, FormProvider } from 'react-hook-form';
import { UIButton, UICard, UIInput } from '../../../components/common/ui';
import { categoryRules } from "../validations/categoryRules.js";

const AddNewCategory = ({
	isEditing,
	category,
	onSubmit,
	onCancel
}) => {
	const methods = useForm({
		defaultValues: category
	});

	const {
		handleSubmit,
		reset
	} = methods;

	useEffect(() => {
		reset(category);
	}, [category, reset]);

	const rules  = categoryRules();

	return (
		<FormProvider {...methods}>
			<UICard
				variant="primary"
				title={isEditing ? 'Edit Category' : 'Add New Category'}
				headerIcon={isEditing ? 'edit' : 'plus-circle'}
			>
				<form onSubmit={handleSubmit(onSubmit)}>
					<UIInput
						name="name"
						label="Name"
						placeholder="e.g. Job position"
						rules={rules.name}
					/>

					<div className="d-grid gap-2">
						<UIButton type="submit" variant="success">
							{isEditing ? 'Update category' : 'Save category'}
						</UIButton>

						{isEditing && (
							<UIButton
								variant="outline-secondary"
								type="button"
								onClick={onCancel}
							>
								Cancel
							</UIButton>
						)}
					</div>
				</form>
			</UICard>
		</FormProvider>
	);
};

export default AddNewCategory;
